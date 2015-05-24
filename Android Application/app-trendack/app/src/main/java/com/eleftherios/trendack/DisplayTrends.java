package com.eleftherios.trendack;

import java.util.ArrayList;
import java.util.HashMap;
import android.app.ListActivity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;

import android.view.View;
import android.view.Window;

import android.widget.AdapterView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class DisplayTrends extends ListActivity {

    TextView country;

    private ProgressDialog dialog;

    public String selected_country;

    // Hashmap for ListView
    ArrayList<HashMap<String, String>> trendList;


    @Override
    protected void onCreate(Bundle savedInstanceState) {

        //Remove title bar
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);

        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_display_trends);

        trendList = new ArrayList<>();

        Bundle extras = getIntent().getExtras();

        //Get the country user clicked
        if (extras != null) {

            selected_country = extras.getString("Country");
            country = (TextView) findViewById(R.id.selected_country);
            country.setText("People On " + selected_country + " Are Talking About");
        }

        //Replace Spaces
        selected_country = selected_country.replace(" ", "+");

        try {
            new GetTrends().execute();
        }
        catch (Exception e) {
            Toast.makeText(getApplicationContext(), "No Network Access", Toast.LENGTH_LONG).show();
        }

    }

    private class GetTrends extends AsyncTask<Void, Void, Void> {

        public String selected_trend;
        ListView lv = getListView();

        @Override
        protected void onPreExecute() {
            super.onPreExecute();

            // Showing progress dialog
            dialog = new ProgressDialog(DisplayTrends.this);
            dialog.setMessage("Duck is getting the trends");
            dialog.setCancelable(true);
            dialog.show();

        }

        @Override
        protected Void doInBackground(Void... arg0) {

            // Creating service handler class instance
            ServiceHandler sh = new ServiceHandler();

            String jsonStr;

            jsonStr = sh.makeServiceCall("http://192.168.1.64/foo/jason.php?country=" + selected_country, ServiceHandler.GET);

            if (jsonStr != null) {
                try {

                    // Convert response string to JSON array
                    JSONArray ja = new JSONArray(jsonStr);

                    int n = ja.length();

                    // Looping through all trends
                    for (int i = 0; i < n; i++) {

                        // Get individual JSON object from JSON array
                        JSONObject jo = ja.getJSONObject(i);



                            String name = jo.getString("trend");

                            // Temporary Hashmap for single trend
                            HashMap<String, String> trend = new HashMap<>();

                            // Adding each Trend node to HashMap key => name
                            trend.put("name", name);

                            // Adding trend to trend list
                            trendList.add(trend);

                    }
                }
                catch (JSONException e) {
                    e.printStackTrace();
                }
            }

            return null;
        }

        @Override
        protected void onPostExecute(Void result) {
            super.onPostExecute(result);

            // Dismiss the progress dialog
            if (dialog.isShowing())
                dialog.dismiss();

            ListAdapter adapter = new SimpleAdapter(
                    DisplayTrends.this, trendList,
                    R.layout.trend_list_item, new String[]{"name"}, new int[]{R.id.trend});

            setListAdapter(adapter);

            lv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                public void onItemClick(AdapterView<?> parent, View view,
                                        int position, long id) {

                    selected_trend = lv.getItemAtPosition(position).toString();
                    selected_trend = selected_trend.substring(6, selected_trend.length()-1);

                    Intent intent = new Intent(getApplicationContext(), DisplayTweets.class);
                    intent.putExtra("Trend",selected_trend);

                    startActivity(intent);
                }
            });

        }
    }

}

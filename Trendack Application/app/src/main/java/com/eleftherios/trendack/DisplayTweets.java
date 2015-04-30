package com.eleftherios.trendack;

import java.util.ArrayList;
import java.util.HashMap;

import android.app.ListActivity;
import android.app.ProgressDialog;
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

public class DisplayTweets extends ListActivity {

    TextView trend;

    private ProgressDialog dialog;
    public String selected_trend;

    // Hashmap for ListView
    ArrayList<HashMap<String, String>> tweetList;


    @Override
    protected void onCreate(Bundle savedInstanceState) {

        //Remove title bar
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);

        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_display_trends);

        tweetList = new ArrayList<>();

        Bundle extras = getIntent().getExtras();

        if (extras != null) {

            selected_trend = extras.getString("Trend");
            trend = (TextView) findViewById(R.id.selected_country);
            trend.setText("Popular Tweets About " + selected_trend);
        }

        selected_trend = selected_trend.replace(" ", "+");
        selected_trend = selected_trend.replace("#", "%23");

        try {
            new GetTweets().execute();
        }
        catch (Exception e) {
            Toast.makeText(getApplicationContext(), "No Network Access", Toast.LENGTH_LONG).show();
            finish();
        }
    }

    private class GetTweets extends AsyncTask<Void, Void, Void> {

        ListView lv = getListView();

        @Override
        protected void onPreExecute() {
            super.onPreExecute();

            // Showing progress dialog
            dialog = new ProgressDialog(DisplayTweets.this);
            dialog.setMessage("Duck is getting the tweets");
            dialog.setCancelable(false);
            dialog.show();

        }

        @Override
        protected Void doInBackground(Void... arg0) {

            // Creating service handler class instance
            ServiceHandler sh = new ServiceHandler();

            String jsonStr;

            jsonStr = sh.makeServiceCall("http://192.168.1.64/foo/jason.php?trend=" + selected_trend, ServiceHandler.GET);

            if (jsonStr != null) {
                try {

                    // Convert response string to JSON array
                    JSONArray ja = new JSONArray(jsonStr);

                    // Looping through all trends
                    int n = ja.length();

                    for (int i = 0; i < n; i++) {

                        // Get individual JSON object from JSON array
                        JSONObject jo = ja.getJSONObject(i);

                        // Retrieve each JSON object's fields
                        String name = jo.getString("text");

                        // Temporary Hashmap for single tweet
                        HashMap<String, String> tweet = new HashMap<>();

                        // adding each tweet node to HashMap key => name
                        tweet.put("name", name);

                        // Adding tweet to tweet list
                        tweetList.add(tweet);
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
                    DisplayTweets.this, tweetList,
                    R.layout.tweet_list_item, new String[]{"name"}, new int[]{R.id.tweet});

            setListAdapter(adapter);

            lv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                public void onItemClick(AdapterView<?> parent, View view,
                                        int position, long id) {
                }
            });

        }
    }

}

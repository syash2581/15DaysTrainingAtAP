package com.example.listactivity;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.EditText;

public class WebViewDemo extends AppCompatActivity {

    WebView wv1;
    EditText etSearch;
    Button search;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_web_view_demo);

        wv1 = findViewById(R.id.wv1);
        etSearch = findViewById(R.id.etUrl);
        search = findViewById(R.id.search);


        search.setOnClickListener(this::onClick);
    }
    public void onClick(View v)
    {
        switch (v.getId()){
            case R.id.search:
                wv1.getSettings().setJavaScriptEnabled(true);

                wv1.setWebViewClient(new MyWebViewClient());
                wv1.loadUrl(etSearch.getText().toString());
                break;
        }
    }
    private class MyWebViewClient extends WebViewClient{
        @Override
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
//            return super.shouldOverrideUrlLoading(view, url);
            view.loadUrl(url);
            return true;
        }
    }
}


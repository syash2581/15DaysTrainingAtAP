package com.example.customlistviewdemo;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.TextView;

public class SecondActivity extends AppCompatActivity {

    ImageView iv2;
    TextView tv2;


    String name;
    int key;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_second);

        iv2 = findViewById(R.id.iv2);
        tv2 = findViewById(R.id.tv2);


        Intent intent = getIntent();

        name = intent.getStringExtra("name");
        key = intent.getIntExtra("image",R.drawable.ic_launcher_foreground);

        tv2.setText(name);
        iv2.setImageResource(key);
    }
}
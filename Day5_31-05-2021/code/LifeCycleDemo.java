package com.example.intentdemo;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;

public class LifeCycleDemo extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_life_cycle_demo);
        Log.d("Life Cycle","In onCreate()");

    }

    @Override
    protected void onStart() {
        super.onStart();
        Log.d("Life Cycle","In onStart()");
    }

    @Override
    protected void onResume() {
        super.onResume();
        Log.d("Life Cycle","In onResume()");
    }

    @Override
    protected void onPause() {
        super.onPause();
        Log.d("Life Cycle","In onPause()");
    }

    @Override
    protected void onStop() {
        super.onStop();
        Log.d("Life Cycle","In onStop()");
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        Log.d("Life Cycle","In onDestory()");
    }
}

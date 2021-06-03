package com.example.listactivity;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.GridView;
import android.widget.ListView;
import android.widget.Toast;

public class GridActivity extends AppCompatActivity {


    String names[] = {"Demo 1","Demo 2","Demo 3","Demo 4","Demo 5","Demo 6","Demo 7","Demo 8","Demo 9","Demo 10","Demo 11","Demo 12","Demo 13","Demo 14","Demo 15","Demo 16"
    ,"Demo 17","Demo 18","Demo 19","Demo 20","Demo 21","Demo 22","Demo 23","Demo 24","Demo 25","Demo 26"};
    GridView lv1;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_grid);

        lv1 = findViewById(R.id.gv1);

        ArrayAdapter arrayAdapter = new ArrayAdapter(GridActivity.this, android.R.layout.simple_list_item_1,names);
        lv1.setAdapter(arrayAdapter);

        lv1.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Toast.makeText(GridActivity.this,"You selected : "+names[position],Toast.LENGTH_LONG).show();
            }
        });
    }
}
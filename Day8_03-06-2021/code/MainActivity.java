package com.example.customlistviewdemo;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.GridView;
import android.widget.ListView;

public class MainActivity extends AppCompatActivity {

    int images[]={R.drawable.apple,R.drawable.avocado,R.drawable.banana,R.drawable.chiku,R.drawable.grapes,R.drawable.guava,R.drawable.kiwi,
    R.drawable.lychee,R.drawable.mango,R.drawable.orange,R.drawable.papaya,R.drawable.pear,R.drawable.pineapple,R.drawable.strawberry,R.drawable.watermelon};
    String names[]={
            "This is apple",
            "This is avocado",
            "This is banana",
            "This is chiku",
            "This is grapes",
            "This is guava",
            "This is kiwi",
            "This is lychee",
            "This is mango",
            "This is orange",
            "This is papaya",
            "This is pear",
            "This is pineapple",
            "This is strawberry",
            "This is watermelon",
    };
    GridView lv1 ;
//    ListView lv1;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        lv1 = findViewById(R.id.lv1);

        MyAdapter myAdapter = new MyAdapter(names,images,MainActivity.this);
        lv1.setAdapter(myAdapter);

        lv1.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent intent = new Intent(MainActivity.this,SecondActivity.class);

                intent.putExtra("name",names[position]);
                Log.d("Image is ",images[position]+"");
                intent.putExtra("image",images[position]);

                startActivity(intent);
            }
        });

    }
}
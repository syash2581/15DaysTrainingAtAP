package com.example.app;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.*;

public class Square extends AppCompatActivity {


    EditText etSquare;
    TextView tvSquare;
    Button btnSquare;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_square);

        etSquare = (EditText) findViewById(R.id.etSquare);
        tvSquare = (TextView) findViewById(R.id.tvSquare);
        btnSquare = (Button) findViewById(R.id.btnSquare);

        btnSquare.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int num = Integer.parseInt(etSquare.getText().toString());
                if(num<10)
                {
                    Toast.makeText(Square.this,"Square of "+num+" is : "+num*num,Toast.LENGTH_LONG).show();
                    tvSquare.setText("Square of "+num+" is : "+num*num);
                }
                else
                {
                    Toast.makeText(Square.this,"Sorry the number is greater than 10",Toast.LENGTH_LONG).show();
                    tvSquare.setText("Sorry the number is greater than 10");
                }
            }
        });
    }
}
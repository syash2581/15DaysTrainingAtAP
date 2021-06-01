package com.example.app;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class CheckSign extends AppCompatActivity {


    EditText etSign;
    TextView tvSign;
    Button btnSign;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_check_sign);


        etSign = (EditText) findViewById(R.id.etSign);
        tvSign = (TextView) findViewById(R.id.tvSign);
        btnSign = (Button) findViewById(R.id.btnSign);


        btnSign.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int num = Integer.parseInt(etSign.getText().toString());
                String text;
                if(num>0)
                {
                    text="Entered Number is positive";
                    tvSign.setText("Entered Number is positive");
                }
                else if(num==0)
                {
                    text="Entered Number is zero";
                    tvSign.setText("Entered Number is zero");
                }
                else {
                    text="Entered Number is negative";
                    tvSign.setText("Entered Number is negative");
                }
                Toast.makeText(CheckSign.this,text,Toast.LENGTH_LONG).show();
            }
        });
    }
}
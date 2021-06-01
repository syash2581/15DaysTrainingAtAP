package com.example.app;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.*;

public class BasicCalc extends AppCompatActivity {


    EditText num1,num2;
    Button add,sub,mul,div;
    TextView ans;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_basic_calc);


        num1=(EditText) findViewById(R.id.editTextNumber1);
        num2=(EditText)findViewById(R.id.editTextNumber2);

        add=(Button) findViewById(R.id.button);
        sub=(Button)findViewById(R.id.button2);
        mul=(Button)findViewById(R.id.button3);
        div=(Button)findViewById(R.id.button4);

        ans=(TextView) findViewById(R.id.textView2);

        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int answer = Integer.parseInt(num1.getText().toString())+Integer.parseInt(num2.getText().toString());
                ans.setText(String.valueOf(answer));
                Toast.makeText(BasicCalc.this,String.valueOf(answer),Toast.LENGTH_LONG).show();
            }
        });

        sub.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                int answer = Integer.parseInt(num1.getText().toString())-Integer.parseInt(num2.getText().toString());
                ans.setText(String.valueOf(answer));
                Toast.makeText(BasicCalc.this,String.valueOf(answer),Toast.LENGTH_LONG).show();
            }
        });

        mul.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                int answer = Integer.parseInt(num1.getText().toString())*Integer.parseInt(num2.getText().toString());
                ans.setText(String.valueOf(answer));
                Toast.makeText(BasicCalc.this,String.valueOf(answer),Toast.LENGTH_LONG).show();
            }
        });

        div.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                int answer = Integer.parseInt(num1.getText().toString())/Integer.parseInt(num2.getText().toString());
                ans.setText(String.valueOf(answer));
                Toast.makeText(BasicCalc.this,String.valueOf(answer),Toast.LENGTH_LONG).show();
            }
        });
    }
}
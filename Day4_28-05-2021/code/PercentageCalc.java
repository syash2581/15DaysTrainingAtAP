package com.example.app;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.*;

public class PercentageCalc extends AppCompatActivity {


    EditText num1,num2,num3,num4,num5;
    Button find;
    TextView tvPer,tvGrade;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_percentage_calc);

        num1 = (EditText) findViewById(R.id.editTextNumber);
        num2 = (EditText) findViewById(R.id.editTextNumber3);
        num3 = (EditText) findViewById(R.id.editTextNumber4);
        num4 = (EditText) findViewById(R.id.editTextNumber5);
        num5 = (EditText) findViewById(R.id.editTextNumber6);

        find = (Button) findViewById(R.id.button3);

        tvPer = (TextView) findViewById(R.id.textView3);
        tvGrade = (TextView) findViewById(R.id.textView4);


        find.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int n1,n2,n3,n4,n5;

                n1 =Integer.parseInt(num1.getText().toString());
                n2 =Integer.parseInt(num2.getText().toString());
                n3 =Integer.parseInt(num3.getText().toString());
                n4 =Integer.parseInt(num4.getText().toString());
                n5 =Integer.parseInt(num5.getText().toString());

                double per = (n1+n2+n3+n4+n5)/5.0;


                String grade="FF";

                if(per>80)
                {
                    grade ="AA";
                }
                else if(per>60 && per<=80){ grade ="AB"; }
                else if(per>=35 && per<=60){ grade ="BB"; }
                else if(per>20 && per<35){ grade ="FF"; }



                tvPer.setText(String.valueOf(per));
                tvGrade.setText(grade);

                Toast.makeText(PercentageCalc.this,"Your percentage is:  "+per+" and grade is: "+grade,Toast.LENGTH_LONG).show();
            }
        });

    }
}
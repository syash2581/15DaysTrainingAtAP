package com.example.app;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class FindGreater extends AppCompatActivity {
    EditText etNum1,etNum2;
    TextView tvGreater;
    Button btnGreater;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_find_greater);


        etNum1 = (EditText) findViewById(R.id.etNum1G);
        etNum2 = (EditText) findViewById(R.id.etNum2G);
        tvGreater = (TextView) findViewById(R.id.tvGreater);
        btnGreater = (Button) findViewById(R.id.btnGreater);

        btnGreater.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int num1 = Integer.parseInt(etNum1.getText().toString());
                int num2 = Integer.parseInt(etNum2.getText().toString());
                if (num1 > num2) {
                    tvGreater.setText(num1 + " is greater.");
                    Toast.makeText(FindGreater.this, num1 + " is greater.", Toast.LENGTH_LONG).show();
                } else if (num1 == num2) {
                    tvGreater.setText("both are equal");
                    Toast.makeText(FindGreater.this, "both are equal", Toast.LENGTH_LONG).show();

                } else {
                    tvGreater.setText(num2 + " is greater.");
                    Toast.makeText(FindGreater.this, num2 + " is lesser.", Toast.LENGTH_LONG).show();

                }
            }
        });

    }
}
package com.example.intentdemo2;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.telephony.SmsManager;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class SmsActivity extends AppCompatActivity {
    EditText etSMSTo,etSMSText;
    Button btnSMSSend;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sms);

        etSMSTo = findViewById(R.id.etSMSTo);
        etSMSText = findViewById(R.id.etSMSText);

        btnSMSSend = findViewById(R.id.btnSMSSend);

        btnSMSSend.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                SmsManager smsManager = SmsManager.getDefault();

                smsManager.sendTextMessage(etSMSTo.getText().toString(),null,etSMSText.getText().toString(),null,null);
            }
        });
    }
}
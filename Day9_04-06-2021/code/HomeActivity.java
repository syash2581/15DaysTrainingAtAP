package com.example.sharedpreferencesdemo;

import androidx.appcompat.app.AppCompatActivity;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class HomeActivity extends AppCompatActivity {


    TextView etName,etContact,etEmail;
    Button btnLogout;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        etName = findViewById(R.id.etName);
        etContact = findViewById(R.id.etContact);
        etEmail = findViewById(R.id.etEmail);

        btnLogout = findViewById(R.id.btnLogOut);


        SharedPreferences preferences = getSharedPreferences(SignUp.MyKey, HomeActivity.this.MODE_PRIVATE);

        etName.setText(preferences.getString(SignUp.UserId,""));
        etContact.setText(preferences.getString(SignUp.Contact,""));
        etEmail.setText(preferences.getString(SignUp.Email,""));


        btnLogout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                SharedPreferences.Editor editor = preferences.edit();
                editor.clear();
                editor.commit();
                finish();
//                To completely close the application
//                moveTaskToBack(true);
            }
        });
    }
}
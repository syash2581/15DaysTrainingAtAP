package com.example.sharedpreferencesdemo;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    EditText etUserId,etPassword;
    Button btnLogin,btnSignUp;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        etUserId = findViewById(R.id.etUserId);
        etPassword = findViewById(R.id.etPassword);

        btnLogin = findViewById(R.id.btLogin);
        btnSignUp = findViewById(R.id.btSignUp);


        btnSignUp.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                    Intent intent  = new Intent(MainActivity.this,SignUp.class);
                    startActivity(intent);
            }
        });


        btnLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                SharedPreferences preferences = getSharedPreferences(SignUp.MyKey,MainActivity.this.MODE_PRIVATE);

                String userId = etUserId.getText().toString() ;
                String password=etPassword.getText().toString();

                String tempUserId=preferences.getString(SignUp.UserId,"");
                String tempPassword=preferences.getString(SignUp.Password,"");

                if(tempUserId!="" && tempPassword!="")
                {
                    if(userId.equals(tempUserId) && password.equals(tempPassword))
                    {
                        Intent intent = new Intent(MainActivity.this,HomeActivity.class);
                        startActivity(intent);
                    }
                    else
                    {
                        Toast.makeText(MainActivity.this,"Invalid attempt",Toast.LENGTH_LONG).show();
                    }
                }
                else
                {
                    Toast.makeText(MainActivity.this,"Invalid attempt",Toast.LENGTH_LONG).show();
                }

            }
        });
    }
}
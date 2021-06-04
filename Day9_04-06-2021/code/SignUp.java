package com.example.sharedpreferencesdemo;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class SignUp extends AppCompatActivity {


    static String MyKey = "MyKey";
    static String UserId = "UserId";
    static String Email = "Email";
    static String Contact = "Contact";
    static String Password = "Password";


    EditText etUserId1,etEmail1,etContact1,etPassword1;
    Button btnRegister;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_up);

        btnRegister = findViewById(R.id.btRegister);

        etUserId1=findViewById(R.id.etUserId1);
        etEmail1=findViewById(R.id.etEmail1);
        etContact1=findViewById(R.id.etContact1);
        etPassword1=findViewById(R.id.etPassword1);



        btnRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String userid=etUserId1.getText().toString();
                String email=etEmail1.getText().toString();
                String contact=etContact1.getText().toString();
                String password=etPassword1.getText().toString();


                SharedPreferences preferences = getSharedPreferences(MyKey,SignUp.this.MODE_PRIVATE);
                SharedPreferences.Editor editor= preferences.edit();

                editor.putString(UserId,userid);
                editor.putString(Email,email);
                editor.putString(Contact,contact);
                editor.putString(Password,password);

                editor.commit();

                Toast.makeText(SignUp.this,"Registered",Toast.LENGTH_LONG).show();
                Intent intent = new Intent(SignUp.this,MainActivity.class);
                startActivity(intent);

            }
        });


    }
}
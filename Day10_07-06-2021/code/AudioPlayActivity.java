package com.example.intentdemo2;

import androidx.appcompat.app.AppCompatActivity;

import android.media.MediaPlayer;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class AudioPlayActivity extends AppCompatActivity {

    Button play,pause,stop;
    MediaPlayer mediaPlayer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_audio_play);

        play = findViewById(R.id.button);
        pause = findViewById(R.id.button2);
        stop = findViewById(R.id.button3);

        play.setOnClickListener(this::onClick);
        pause.setOnClickListener(this::onClick);
        stop.setOnClickListener(this::onClick);

        mediaPlayer = MediaPlayer.create(AudioPlayActivity.this,R.raw.windows_7_startup);
    }
    public void onClick(View v){
        switch (v.getId()){
            case R.id.button:
                mediaPlayer.start();
                break;
            case R.id.button2:
                mediaPlayer.pause();
                break;
            case R.id.button3:
                mediaPlayer.stop();
                break;
        }
    }
}

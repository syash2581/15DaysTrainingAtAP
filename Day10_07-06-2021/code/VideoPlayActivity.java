package com.example.intentdemo2;

import androidx.appcompat.app.AppCompatActivity;

import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.widget.MediaController;
import android.widget.Toast;
import android.widget.VideoView;

public class VideoPlayActivity extends AppCompatActivity {

    VideoView videoView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_video_play);

        videoView = findViewById(R.id.vw1);

        MediaController mediaController = new MediaController(this);
        mediaController.setAnchorView(videoView);


        Uri uri = Uri.parse("android.resource://"+getPackageName()+"/"+R.raw.wildlife_in_hd_windows_7_sample_video_1080p);

        videoView.setMediaController(mediaController);

        videoView.setVideoURI(uri);
        videoView.start();

        videoView.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
            @Override
            public void onCompletion(MediaPlayer mp) {
                Toast.makeText(VideoPlayActivity.this,"Thank you...",Toast.LENGTH_LONG).show();
            }
        });

        videoView.setOnErrorListener(new MediaPlayer.OnErrorListener() {
            @Override
            public boolean onError(MediaPlayer mp, int what, int extra) {
                Toast.makeText(VideoPlayActivity.this,"Error",Toast.LENGTH_LONG).show();
                return false;
            }
        });
    }
}
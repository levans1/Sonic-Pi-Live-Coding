# Welcome to Sonic Pi v3.
back="C:/Users/logan_evans/Desktop/final_sonicpi_songs/samples/backingtrack.wav"
elio= "C:/Users/logan_evans/Desktop/final_sonicpi_songs/samples/cmbyn_dialouge.wav"
love="C:/Users/logan_evans/Desktop/final_sonicpi_songs/samples/love.wav"
friend= "C:/Users/logan_evans/Desktop/final_sonicpi_songs/samples/friend2.wav"

define:frienship do
  sample friend
  print sample_duration friend
end
x=1
use_bpm 131
use_synth :piano
2.times do
  sample love, rate: x, amp: 5
  print sample_duration love
  x=x-0.25
  sleep 15.8
end
live_loop :backtrack do
  5.times do
    sample back, amp: 5
    print sample_duration back
    sleep 32.8
  end
  1.times do
    frienship
  end
  stop
end
notes=[:g5, :e5,:b4,:c5,:b4,:a4,:r,:b4,:c5,:d5,:b4,:f4]
rests=[1,1,1.5,0.25,0.25,2,2,1,1,1.5,0.5,2]
index=0
rests_index=0
define :song do
  12.times do
    play notes[index]
    sleep rests[rests_index]
    index=index+1
    rests_index=rests_index+1
  end
end
live_loop :demarco do
  4.times do
    sleep 18.8
    sample elio, amp: 5
    song
    index=0
    rests_index=0
  end
  stop
end
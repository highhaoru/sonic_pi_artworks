# Welcome to Sonic Pi

use_bpm 130
live_loop :met do
  sleep 1
end

# Simulating Chinese percussion with woodblock sounds
live_loop :woodblock, sync: :met do
  sample :perc_snap, amp: 1.5 if spread(5, 12).tick
  sleep 0.25
end

# Keeping the bass part but using a sound similar to a zither
live_loop :bass, sync: :met do
  use_synth :pluck
  play :e2, release: 4
  sleep 4
  play :d2, release: 4
  sleep 4
end

# Simulating a Chinese-style melody
live_loop :melody, sync: :met do
  use_synth :zawa
  use_synth_defaults attack: 0.1, release: 1, cutoff: 80
  # Using a Chinese-style pentatonic scale
  notes = scale(:e3, :major_pentatonic, num_octaves: 2).shuffle
  play notes.tick, release: 0.5, amp: 0.6
  sleep 0.5
end

# Main melody - Chinese style electronic music
live_loop :main_melody, sync: :met do
  use_synth :saw
  use_synth_defaults release: 0.5, amp: 0.8, cutoff: 90
  
  # Chinese pentatonic scale, using major_pentatonic or minor_pentatonic
  notes = scale(:e3, :major_pentatonic).shuffle
  8.times do
    play notes.tick, release: 0.25
    sleep 0.5
  end
end

# Blending Chinese melodies with electronic effects
live_loop :melody_with_fx, sync: :met do
  use_synth :zawa
  use_synth_defaults attack: 0.1, release: 1, cutoff: 80
  notes = scale(:e3, :major_pentatonic, num_octaves: 2).shuffle
  with_fx :reverb, mix: 0.5 do
    with_fx :echo, mix: 0.3, phase: 0.25 do
      play notes.tick, release: 0.5, amp: 0.6
      sleep 0.5
    end
  end
end

# Main melody - Chinese style electronic music
live_loop :main_melody, sync: :met do
  use_synth :tb303
  use_synth_defaults release: 0.5, amp: 0.8, cutoff: 100, res: 0.8
  
  # Chinese pentatonic scale
  notes = scale(:e3, :major_pentatonic).shuffle
  with_fx :wobble, phase: 2, mix: 0.2 do
    8.times do
      play notes.tick, release: 0.25, amp: 0.7
      sleep 0.5
    end
  end
end

# Dynamic electronic drum rhythm
live_loop :electro_drums, sync: :met do
  # Basic drum beat
  sample :bd_haus, amp: 2
  sleep 0.5
  sample :sn_dolf, amp: 1.5 if one_in(2)
  sleep 0.25
  sample :bd_haus, amp: 1.5 if one_in(4)
  sleep 0.25
  
  # Rapid-fire fill-ins
  with_fx :reverb, mix: 0.4 do
    4.times do
      sample :drum_cymbal_pedal, rate: 1.5, amp: 0.5
      sleep 0.125
    end
  end
  
  # Varied drum sounds
  sample :elec_snare, amp: 1.5
  sleep 0.5
  sample :elec_hi_snare, amp: 0.75
  sleep 0.5
  sample :elec_mid_snare, amp: 0.5 if one_in(3)
  sleep 0.25
  sample :elec_cymbal, amp: 0.5 if one_in(2)
  sleep 0.25
end

# Adding a new electronic synth sound
live_loop :electro_synth, sync: :met do
  use_synth :mod_saw
  use_synth_defaults attack: 0.25, release: 1.5, cutoff: 90
  play_pattern_timed chord(:e3, :minor7), 0.25, release: 0.5, amp: 0.5
  sleep 2
end
# Keep the original metronome loop
use_bpm 130
live_loop :met do
  sleep 1
end

# Change the sound and rhythm of the hi-hat
live_loop :hhc2, sync: :met do
  sample :drum_cymbal_pedal, rate: 1.5, amp: 1
  sleep 0.75
end

# Keep the original bass loop unchanged

# Modify the kick drum sound and rhythm
live_loop :kick, sync: :met do
  if "x---x-x---x-x--".ring.tick == "x" then
    sample :bd_haus, amp: 1.25
  end
  sleep 0.25
end

# Change the sound and rhythm of the hand clap
live_loop :clap, sync: :met do
  with_fx :echo, mix: 0.3 do
    sleep 0.5
    sample :perc_snap, amp: 1
    sleep 1.5
  end
end

# Change the sound and rhythm of another hi-hat
live_loop :hhc1, sync: :met do
  if "x-x-x-x-x--x--x-x".ring.tick == "x" then
    sample :drum_cymbal_soft, amp: 0.8, rate: 1.2, pan: [-0.5, 0.5].choose
  end
  sleep 0.125
end

# Change the sound and rhythm of the arpeggio
live_loop :arp, sync: :met do
  with_fx :echo, phase: 0.75, mix: 0.6 do
    use_synth :piano
    notes = (scale :g3, :minor).pick(3)
    play_pattern_timed notes, [0.5, 0.25, 0.75], amp: 0.8
  end
end

# Loop for Indian drums
live_loop :indian_drums, sync: :met do
  # Simulate the sound of Indian percussion with available samples
  sample :drum_tom_hi_hard, amp: 0.5
  sleep 0.25
  sample :drum_tom_mid_hard, amp: 0.5
  sleep 0.25
  
  # Fill rhythm
  with_fx :reverb, mix: 0.4 do
    sample :drum_snare_soft, amp: 0.5
    sleep 0.25
    sample :drum_cymbal_soft, amp: 0.3, rate: 1.25
    sleep 0.25
  end
  
  # Varied drum sounds
  sample :drum_bass_soft, amp: 1.5
  sleep 0.5
  sample :drum_cymbal_open, amp: 0.5, rate: 1.25
  sleep 0.25
  sample :drum_snare_soft, amp: 0.5
  sleep 0.25
end

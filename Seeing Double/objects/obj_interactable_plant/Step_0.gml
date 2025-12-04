// Always increment timer
timer += 1 / 60;

// Decay the shake
if (current_shake > 0) {
    current_shake = lerp(current_shake, 0, 0.1); // Smooth decay
    
    // Snap to 0 when it gets tiny to save processing
    if (current_shake < 0.001) current_shake = 0;
}
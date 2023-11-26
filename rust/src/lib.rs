use godot::prelude::*;
use godot::engine::*;

struct MyExtension;

#[gdextension]
unsafe impl ExtensionLibrary for MyExtension {}


#[derive(GodotClass)]
#[class(base=CharacterBody2D)]
struct PlayerController {
    #[base]
    base: Base<CharacterBody2D>
}

#[godot_api]
impl ICharacterBody2D for PlayerController {
    fn init(base: Base<CharacterBody2D>) -> Self {
        godot_print!("Hello, world!"); // Prints to the Godot console
        
        Self {
            base,
        }
    }


    fn process(&mut self, delta: f64) {
        let mut velocity = Vector2::new(0.0, 0.0);
        let input = Input::singleton();

        if input.is_action_pressed("move_right".into()) {
            velocity += Vector2::RIGHT;
        }
        if input.is_action_pressed("move_left".into()) {
            velocity += Vector2::LEFT;
        }
        if input.is_action_pressed("touch".into()) {
            velocity += Vector2::UP;
        }
        let change = velocity * 100.0 * real::from_f64(delta);
        let position = self.base.get_global_position() + change;
        self.base.set_global_position(position);
    }
}


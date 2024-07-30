// traits1.cairo
// Time to implement some traits!

// Your task is to implement the trait
// `AnimalTrait` for the type `Animal`
//
// Execute `starklings hint traits1` or use the `hint` watch subcommand for a hint.

// Fill in the impl block to make the code work.

// I AM NOT DONE

#[derive(Copy, Drop)]
struct Animal {
    noise: felt252
}

trait AnimalTrait {
    fn new(noise: felt252) -> Animal;
    fn make_noise(self: Animal) -> felt252;
}

impl AnimalImpl of AnimalTrait {
    fn new(noise: felt252) -> Animal {
        Animal { noise }
    }

    fn make_noise(self: Animal) -> felt252 {
        self.noise
    }
}

#[test]
fn test_traits1() {
    let cat = AnimalImpl::new('meow');
    let cow = AnimalImpl::new('moo');

    assert(cat.make_noise() == 'meow', 'Wrong noise');
    assert(cow.make_noise() == 'moo', 'Wrong noise');
}

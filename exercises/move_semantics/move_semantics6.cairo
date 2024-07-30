// move_semantics6.cairo
// Execute `starklings hint move_semantics6` or use the `hint` watch subcommand for a hint.
// You can't change anything except adding or removing references.

// I AM NOT DONE
use debug::PrintTrait;

#[derive(Drop, Clone)]
struct Number {
    value: u32,
}

fn main() {
    let number = Number { value: 1111111 };

    let value = get_value(number.clone());
    println!("{}", value);

    set_value(number);
}

fn get_value(number: Number) -> u32 {
    number.value
}

fn set_value(number: Number) {
    let value = 2222222;
    let number = Number { value };
    println!("{}", number.value);
}

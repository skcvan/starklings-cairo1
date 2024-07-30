// move_semantics2.cairo
// Make me compile without changing line 16 or moving line 13!
// Execute `starklings hint move_semantics2` or use the `hint` watch subcommand for a hint.

use array::ArrayTrait;
use debug::PrintTrait;

// I AM DONE

fn main() {
    let arr0 = ArrayTrait::new();

    let mut _arr1 = fill_arr(arr0.clone());

    // Do not change the following line!
    print(arr0.span()); 
}

fn fill_arr(mut arr: Array<felt252>) -> Array<felt252> {
    arr.append(22);
    arr.append(44);
    arr.append(66);

    arr
}

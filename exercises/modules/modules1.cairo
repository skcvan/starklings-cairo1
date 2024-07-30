// We are writing an app for a restaurant,
// but take_order functions are not being called correctly.
// Can you fix this?

// I AM NOT DONE

mod restaurant {
    pub fn take_order() - felt252 {
        'order_taken'
    }
}

#[test]
fn test_mod_fn() {
    
    let order_result = restaurant::take_order();

    assert(order_result == 'order_taken', '订单未被接收');
}

#[cfg(test)]
mod tests {
    use super::restaurant;

    #[test]
    fn test_super_fn() {
       
        let order_result = restaurant::take_order();

        assert(order_result == 'order_taken', '订单未被接收');
    }
}

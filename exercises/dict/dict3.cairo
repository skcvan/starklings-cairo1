// dict3.cairo
// Custom data structure using dicts
// Using Felt252Dict in structs allow us to simulate mutable data structures
// In this exercise we have a struct Team where a Felt252Dict maps the name of a player to its level and keeps track of
// the number of player.
// Using the methods set and get from the Felt252DictTrait, implement the required functions to interact with the team
// Make me compile and pass the test!
// Execute `starklings hint dict3` or use the `hint` watch subcommand for a hint.

// I AM NOT DONE

use starknet::Felt252Dict;
use starknet::Felt252DictTrait;

#[derive(Destruct)]
struct Team {
    level: Felt252Dict,
    players_count: usize,
}

#[generate_trait]
impl TeamImpl of TeamTrait {
    fn new() - Team {
        Team {
            level: Felt252Dict::new(),
            players_count: 0,
        }
    }

    fn get_level(ref self: Team, name: felt252) - usize {
        match self.level.get(name) {
            Some(level) = level,
            None = 0,
        }
    }

    fn add_player(ref self: Team, name: felt252, level: usize) {
        self.level.insert(name, level);
        self.players_count += 1;
    }

    fn level_up(ref self: Team, name: felt252) {
        if let Some(current_level) = self.level.get(name) {
            self.level.insert(name, current_level + 1);
        }
    }

    fn players_count(self: @Team) - usize {
        self.players_count
    }
}

#[test]
#[available_gas(200000)]
fn test_add_player() {
    let mut team = TeamTrait::new();
    team.add_player('bob', 10);
    team.add_player('alice', 20);

    assert(team.players_count() == 2, 'Wrong number of players');
    assert(team.get_level('bob') == 10, 'Wrong level');
    assert(team.get_level('alice') == 20, 'Wrong level');
}

#[test]
#[available_gas(200000)]
fn test_level_up() {
    let mut team = TeamTrait::new();
    team.add_player('bobby', 10);
    team.level_up('bobby');

    assert(team.get_level('bobby') == 11, 'Wrong level');
}

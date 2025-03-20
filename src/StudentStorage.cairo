#[starknet::contract]
mod StudentStorage{
    use starknet::ContractAddress;
    use starknet::get_caller_address;
    use starknet::storage::Storage;

    #[storage]
    struct Storage{
        name: felt252,
        age: u8,
    }

    #[constructor]
    fn constructor(ref self: ContractState, initial_name: felt252, initial_age){
        self.name.write(initial_name);
        self.age.write(initial_age);
    }

    #[external]
    fn update_name(ref self: ContractState, new_name: felt252){
        self.name.write(new_name);
    }

    #[external]
    fn update_age(ref self: ContractState, new_age: u8){
        self.age.write(new_age);
    }

    #[view]
    fn get_name(self @ContractState) -> felt252 {
        self.name.read();
    }

    #[view]
    fn get_age(self, @ContractState) -> u8 {
        self.age.read();
    }
}
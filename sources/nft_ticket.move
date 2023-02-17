module nft_ticket::ticket{
    use std::signer;
    use std::vector;
    use std::string;

    use aptos_framework::account;
    use aptos_framework::aptos_account;
    use aptos_framework::managed_coin;
    use aptos_framework::coin;

    use aptos_token::token;



  struct Ticket has store{
    name:vector<u8>,
    description:vector<u8>,
    max_quantity:u64,
    price:u64,
    available:u64,
    token_data:token::TokenDataId
  }
}
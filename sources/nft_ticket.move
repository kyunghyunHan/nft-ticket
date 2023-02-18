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

  struct Venue<phantom CoinType>has key{
    name:vector<u8>,
    description:vector<u8>,
    tickets:vector<Ticket>,
    owner:address,
    resource_signer_cap:account::SignerCapability
  }

  public entry fun create_venue<CoinType>(venue_owner:&signer,name:vector<u8>,description:vector<u8>,uri:vector<u8>){
    let tickets= vector::empty<Ticket>();
    let venue_owner_addr= signer::address_of(venue_owner);

    let (resource,resource_signer_cap)= account::create_resource_account(venue_owner,name);
    move_to<Venue<CoinType>>(&resource,Venue{name,description,tickets,owner:venue_owner_addr,resource_signer_cap});
    
    
    token::create_collection(


        &resource,
        string::utf8(name),
        string::utf8(description),
        string::utf8(uri),
        1000,
        vector<bool>[false,false,false]
    )
  }
}
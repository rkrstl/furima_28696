

##usersテーブル

|Column          |Type    | Options     |
|----------------|--------|-------------|
|first_name      |	string|	null:false  |
|last_name       |	string|	null:false  |
|first_name_kana |string  | null_false  |
|last_name_kana  |string  |null:false   |
|nickname        |	string|	null:false  |
|password        |	string|	null:false  |
|birth           |	date  |	null:false  |
|e-mail	         |string	|null:false   |

##Association
has_many :items 
has_many :comments 
has_many :orders 



##itemsテーブル

|Column                                | Type     | Options                        |
|--------------------------------------|--------- |--------------------------------|
|user                                  |references|null:false,foreign_key:true     |
| name                                 |string    |null:false                      |
|text                                  |text      |null:false                      |
|price                                 |integer   |null:false                      |
| scheduled_delivery_id(active_hash)   | integer  | null: false                    |
| shipping_fee_status_id(active_hash)  | integer  | null: false                    |
| prefecture_id(active_hash)           | integer  | null: false                    |
| sales_status_id(active_hash)         | integer  | null: false                    |
| category_id(active_hash)             | integer  | null: false                    |


#Association
belongs_to: user
has_one :order
has_many: comments 



##deliver_addressesテーブル

|Column                        | Type     |Options                      |
|------------------------------|----------|-----------------------------|
|order                         |references|nill:false,foreign_key:true  |
|prefecture_id(active_hash)    | integer  | null: false                 |
|postal-code                   |string    |null:false                   |
|city                          |string    |null:false                   |
|address1                      |string    |null:false                   | 
|address2                      |string    |                             |
|telephone                     |string    |null:false                   |

#Association
belongs_to:order



##commentsテーブル
|Column        | Type      |Options                    |
|--------------|-----------|---------------------------|
|user          |references |null:false,foreign_key:true|
|item          |references |null:false,foreign_key:true|
|text          |text       |null:false                 |

#Association
belongs_to:user 
belongs_to:item 

##ordersテーブル
|Columns   |Type        |Options                    |
|----------|------------|---------------------------|
|user      |references  |null:false,foreign_key:true|
|item      |references  |null:false,foreign_key:true|


#Association
belongs_to :user
belongs_to :item
has one     :deliver_address
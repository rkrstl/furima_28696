

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
has_many :item
has_many :comments dependent: :destroy
has_many :deliver_addresses dependent: :destroy



##itemsテーブル

|Column         | Type     | Options                        |
|---------------|--------- |--------------------------------|
|user_id        |string    |null:false,foreign_key:true     |
| name          |string    |null:false                      |
|text           |text      |null:false                      |
|seller_user_id |references|null:false,foreign_key:true     |
|category       |string    |null:false                      |
|condition      |string    |null:false                      |
|shipping_burden|string    |null:false                      |
|duration       |string    |null:false                      |
|price          |integer   |null:false                      |


#Association
belongs_to: user
has_one: :deliver_addresses dependent: :destroy
has_many: comments dependent: :destroy



##deliver_addressesテーブル

|Column     | Type     |Options                       |
|-----------|----------|-----------------------------|
|user       |references|null:false,foreign_key:true  |
|postal-code|integer   |null:false                   |
|city       |string    |null:false                   |
|address1   |string    |null:false                   |
|address2   |string    |                             |
|telephone  |string   |null:false                   |

#Association
belongs_to: user


##commentsテーブル
|Column        | Type      |Options                    |
|-----------   |-----------|---------------------------|
|user_id       |references |null:false,foreign_key:true|
|products_id   |references |null:false,foreign_key:true|
|text          |text       |null:false                 |

#Association
belongs_to:user
belongs_to:item



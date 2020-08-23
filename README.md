

##usersテーブル

|Column     |Type   | Options     |
|---------- |-------|-------------|
|first_name |	string|	null:false  |
|last_name  |	string|	null:false  |
|nickname   |	string|	null:false  |
|password   |	string|	null:false  |
|birth_month|	string|	null:false  |
|birth_day	|string	|null:false   |
|e-mail	    |string	|null:false   |

##Association
has_many :products
has_many :comments dependent: :destroy
has_many :deliver_addresses dependent: :destroy



##productsテーブル

|Column         | Type     | Options                        |
|---------------|--------- |--------------------------------|
| name          |string    |null:false                      |
|text           |text      |null:false                      |
|seller_user_id |references|null:false,foreign_key:true     |
|category_id    |references|null:false,foreign_key:true     |
|condition      |string    |null:false                      |
|shipping_id    |references|null:false,foreign_key:true     |
|price          |integer   |null:false                      |


#Association
belongs_to: user
has_one: :deliver_addresses dependent: :destroy
has_many: comments dependent: :destroy
has_one:shippings dependent: :destroy
has_many:categories dependent: :destroy



##deliver_addressesテーブル

|Column     | Type    |Options                       |
|-----------|----------|-----------------------------|
|user_id    |references|null:false,foreign_key:true  |
|postal-code|integer   |null:false                   |
|prefecture |string    |null:false                   |
|city       |string    |null:false                   |
|address1   |string    |null:false                   |
|address2   |string    |                             |
|telephone  |integer   |null:false                   |

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
belongs_to:products

##categoriesテーブル

|Column     | Type    |Options        |
|-----------|---------|---------------|
|name       |string   |null:false     |

#association
has_many: products


##shippingsテーブル
|Column        |Type       |Options      |
|--------------|-----------|-------------|
|area          |string     |null:false   |
|duration      |string     |null:false   |

#association
belongs_to: products
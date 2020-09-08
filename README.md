# テーブル設計

## user_personals テーブル

| Column          | Type       | Options                  |
| --------------- | ---------- | ------------------------ |
| first_name      | string     | null: false              |
| family_name     | string     | null: false              |
| birthday        | date       | null: false, default: "" |
| age             | integer    | null: false, default: "" |
| phone_num       | string     | null: false, default: "" |
| email           | string     | null: false              |
| password        | string     | null: false              |

### Association

* has_one :user_address
* has_one :card
* has_many :feeling_details
* has_many :items
* has_many :joys
* has_many :trusts
* has_many :fears
* has_many :surprises
* has_many :sadnesses
* has_many :disgusts
* has_many :angers
* has_many :anticipations
* has_many :remorses
* has_many :contempts
* has_many :aggressivenesses
* has_many :optimisms
* has_many :loves
* has_many :submissions
* has_many :awes
* has_many :disapprovals

## user_addresses テーブル

| Column           | Type         | Options                     |
| ---------------- | ------------ | --------------------------- |
| postal_code      | string       | null: false, default: ""    |
| prefecture_id    | integer      | null: false,                |
| city             | string       | null: false, default: ""    |
| addresses        | text         | null: false, default: ""    |
| building         | string       |              default: ""    |
| user_personal_id | references   | null: false, optional: true |

### Association

* belongs_to :user_personal
* extend ActiveHash::Associations::ActiveRecordExtensions
* belongs_to_active_hash :prefecture_id

## cards テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| card_token             | string     | null: false, default: ""       |
| customer_token         | string     | null: false, default: ""       |
| user_personal_id       | references | null: false, foreign_kye: true |

### Association

* belongs_to :user_personal

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false, index: true       |

### Association

* belongs_to :user_personal
* has_one    :item_order
* has_one    :remorse
* has_one    :contempt
* has_one    :aggressiveness
* has_one    :optimism
* has_one    :love
* has_one    :submission
* has_one    :awe
* has_one    :disapproval

## item_orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_id          | references | null: false, foreign_kye: true |
| user_personal_id | references | null: false, foreign_kye: true |

### Association

* belongs_to :item

## feeling_details テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| feeling_id       | integer    | null: false                    |
| what_detail      | string     | null: false, default: ""       |
| when_detail      | string     |              default: ""       |
| where_id         | integer    | null: false,                   |
| where_detail     | string     |              default: ""       |
| why              | text       | null: false, default: ""       |
| how              | text       | null: false, default: ""       |
| user_personal_id | references | null: false, foreign_kye: true |
| feeling_show_id  | references | null: false, foreign_kye: true |

### Association

* belongs_to :user_personal
* has_one    :feeling_show
* extend ActiveHash::Associations::ActiveRecordExtensions
* belongs_to_active_hash :feeling_id
* belongs_to_active_hash :where_id
* has_many :joys
* has_many :trusts
* has_many :fears
* has_many :surprises
* has_many :sadnesses
* has_many :disgusts
* has_many :angers
* has_many :anticipations
* has_many :remorses
* has_many :contempts
* has_many :aggressivenesses
* has_many :optimisms
* has_many :loves
* has_many :submissions
* has_many :awes
* has_many :disapprovals

## feeling_shows テーブル

| Column   | Type    | Options                  |
| -------- | ------- | ------------------------ |
| what_id  | integer | null: false              |
| when     | date    | null: false, default: "" |

### Association

* belongs_to :feeling_detail
* extend ActiveHash::Associations::ActiveRecordExtensions
* belongs_to_active_hash :what_id
* has_one_attached :image

## joys テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_personal_id  | references | null: false, foreign_kye: true |
| feeling_detail_id | references | null: false, foreign_kye: true |

### Association

* belongs_to :feeling_detail
* belongs_to :user_personal

## trusts テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_personal_id  | references | null: false, foreign_kye: true |
| feeling_detail_id | references | null: false, foreign_kye: true |

### Association

* belongs_to :feeling_detail
* belongs_to :user_personal

## fears テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_personal_id  | references | null: false, foreign_kye: true |
| feeling_detail_id | references | null: false, foreign_kye: true |

### Association

* belongs_to :feeling_detail
* belongs_to :user_personal

## surprises テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_personal_id  | references | null: false, foreign_kye: true |
| feeling_detail_id | references | null: false, foreign_kye: true |

### Association

* belongs_to :feeling_detail
* belongs_to :user_personal

## sadnesses テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_personal_id  | references | null: false, foreign_kye: true |
| feeling_detail_id | references | null: false, foreign_kye: true |

### Association

* belongs_to :feeling_detail
* belongs_to :user_personal

## disgusts テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_personal_id  | references | null: false, foreign_kye: true |
| feeling_detail_id | references | null: false, foreign_kye: true |

### Association

* belongs_to :feeling_detail
* belongs_to :user_personal

## angers テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_personal_id  | references | null: false, foreign_kye: true |
| feeling_detail_id | references | null: false, foreign_kye: true |

### Association

* belongs_to :feeling_detail
* belongs_to :user_personal

## anticipations テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_personal_id  | references | null: false, foreign_kye: true |
| feeling_detail_id | references | null: false, foreign_kye: true |

### Association

* belongs_to :feeling_detail
* belongs_to :user_personal

## remorses テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_personal_id  | references | null: false, foreign_kye: true |
| item_id           | references | null: false, foreign_kye: true |
| feeling_detail_id | references | null: false,    optional: true |

### Association

* belongs_to :feeling_detail
* belongs_to :user_personal
* belongs_to :item

## contempts テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_personal_id  | references | null: false, foreign_kye: true |
| item_id           | references | null: false, foreign_kye: true |
| feeling_detail_id | references | null: false,    optional: true |

### Association

* belongs_to :feeling_detail
* belongs_to :user_personal
* belongs_to :item

## aggressivenesses テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_personal_id  | references | null: false, foreign_kye: true |
| item_id           | references | null: false, foreign_kye: true |
| feeling_detail_id | references | null: false,    optional: true |

### Association

* belongs_to :feeling_detail
* belongs_to :user_personal
* belongs_to :item

## optimisms テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_personal_id  | references | null: false, foreign_kye: true |
| item_id           | references | null: false, foreign_kye: true |
| feeling_detail_id | references | null: false,    optional: true |

### Association

* belongs_to :feeling_detail
* belongs_to :user_personal
* belongs_to :item

## loves テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_personal_id  | references | null: false, foreign_kye: true |
| item_id           | references | null: false, foreign_kye: true |
| feeling_detail_id | references | null: false,    optional: true |

### Association

* belongs_to :feeling_detail
* belongs_to :user_personal
* belongs_to :item

## submissions テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_personal_id  | references | null: false, foreign_kye: true |
| item_id           | references | null: false, foreign_kye: true |
| feeling_detail_id | references | null: false,    optional: true |

### Association

* belongs_to :feeling_detail
* belongs_to :user_personal
* belongs_to :item

## awes テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_personal_id  | references | null: false, foreign_kye: true |
| item_id           | references | null: false, foreign_kye: true |
| feeling_detail_id | references | null: false,    optional: true |

### Association

* belongs_to :feeling_detail
* belongs_to :user_personal
* belongs_to :item

## disapprovals テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_personal_id  | references | null: false, foreign_kye: true |
| item_id           | references | null: false, foreign_kye: true |
| feeling_detail_id | references | null: false,    optional: true |

### Association

* belongs_to :feeling_detail
* belongs_to :user_personal
* belongs_to :item

#### bootstrap 
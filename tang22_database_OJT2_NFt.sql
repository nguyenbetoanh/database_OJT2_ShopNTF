create database ojt_blog_nft_tin_vanh_tang22;
use  ojt_blog_nft_tin_vanh_tang22;
create table User
(
    userID       int auto_increment primary key,
    userName     nvarchar(50) not null unique,
    userPassword nvarchar(50) not null,
    userEmail    nvarchar(50),
    userAvatar   text,
    userStatus   bit
);

create table Blog
(
    blogID           int auto_increment primary key,
    blogTitle        text not null,
    blogContent      text not null,
    blogImage        text,
    blogCreateDate   date,
    userCreatedID    int,
    views int,
    foreign key (userCreatedID) references User (userID)
);

create table Likes
(
    userID int,
    blogID int,
    foreign key (userID) references User (userID),
    foreign key (blogID) references Blog (blogID)
);

create table Comments
(
    commentID      int auto_increment primary key,
    commentDate    date,
    commentContent nvarchar(255),
    commentStatus  bit,
    userID         int,
    blogID         int,
    foreign key (userID) references User (userID),
    foreign key (blogID) references Blog (blogID)
);

create table Tag
(
    tagID     int auto_increment primary key,
    tagName   nvarchar(50),
    tagStatus bit
);

create table Exhibition
(
    exhibitionID          int auto_increment primary key,
    exhibitionTitle       nvarchar(225),
    exhibitionDescription text,
    exhibitionCreatedDate datetime,
    exhibitionExpiredDate datetime,
    exhibitionStatus      bit
);

create table Product
(
    productID          int auto_increment primary key,
    productName        nvarchar(225),
    productPrice       float,
    productImage       text,
    productDescription text,
    productCreatedDate date,
    userID             int,
    exhibitionID int,
    ownersID int,
    foreign key(ownersID) references User(userID),
    foreign key (userID) references User(userID)
);

create table ProductExhibition
(
    productID int,
    exhibitionID int,
    foreign key (exhibitionID) references Exhibition(exhibitionID),
    foreign key(productID) references Product(productID)
);

create table BlogTag
(
    blogID int,
    tagID int,
    foreign key (blogID) references Blog(blogID),
    foreign key (tagID) references Tag(tagID)
);

create table ProductTag
(
    productID int,
    tagID int,
    foreign key (productID) references Product(productID),
    foreign key (tagID) references Tag(tagID)
);

create table ExhibitionTag
(
    exhibitionID int,
    tagID int,
    foreign key (exhibitionID) references Exhibition(exhibitionID),
    foreign key (tagID) references Tag(tagID)
);

create table Following
(
    followID int auto_increment primary key ,
    followerUserID int,
    followingUserID int,
    followStatus bit,
    foreign key (followerUserID) references User(userID),
    foreign key (followingUserID) references User(userID)
);

create table History
(
    historyID int auto_increment primary key ,
    historyDateTime datetime,
    historyPrice float,
    productID int,
    userID int,
    foreign key (productID) references Product(productID),
    foreign key (userID) references User(userID)
);
create table Bid
(
    bidID int auto_increment primary key ,
    bidDateTime datetime,
    bidMonyne float,
    productID int,
    userID int,
    foreign key (productID) references Product(productID),
    foreign key (userID) references User(userID)
);
create table BidTime(
    bidTimeID int auto_increment primary key ,
    startTime datetime,
    endTime datetime
);
create table BidTimeProduct(
    productID int ,
    bidTimeID int,
    foreign key (productID) references Product(productID),
    foreign key (bidTimeID) references BidTime(bidTimeID)
);
create table WishList(
    productID int,
    userID int,
    foreign key (productID) references Product(productID),
    foreign key (userID) references User(userID)
);


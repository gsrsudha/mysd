
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/21/2018 22:05:36
-- Generated from EDMX file: C:\Users\sudha\documents\visual studio 2017\Projects\MYSD\MYSD\MYSDModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-MYSD-20181130075946];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ContactAddress1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Addresses] DROP CONSTRAINT [FK_ContactAddress1];
GO
IF OBJECT_ID(N'[dbo].[FK_HallPricing]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Halls] DROP CONSTRAINT [FK_HallPricing];
GO
IF OBJECT_ID(N'[dbo].[FK_HallAddress]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Halls] DROP CONSTRAINT [FK_HallAddress];
GO
IF OBJECT_ID(N'[dbo].[FK_HallContact]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Contacts] DROP CONSTRAINT [FK_HallContact];
GO
IF OBJECT_ID(N'[dbo].[FK_VenueVendorHall]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Halls] DROP CONSTRAINT [FK_VenueVendorHall];
GO
IF OBJECT_ID(N'[dbo].[FK_VenueVendorContact]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Contacts] DROP CONSTRAINT [FK_VenueVendorContact];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerContact]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Customers] DROP CONSTRAINT [FK_CustomerContact];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerHall]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Customers] DROP CONSTRAINT [FK_CustomerHall];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerOccasion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Customers] DROP CONSTRAINT [FK_CustomerOccasion];
GO
IF OBJECT_ID(N'[dbo].[FK_LoginActivityLogin]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LoginActivities] DROP CONSTRAINT [FK_LoginActivityLogin];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerLogin]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Customers] DROP CONSTRAINT [FK_CustomerLogin];
GO
IF OBJECT_ID(N'[dbo].[FK_VenueVendorLogin]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[VenueVendors] DROP CONSTRAINT [FK_VenueVendorLogin];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[VenueVendors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[VenueVendors];
GO
IF OBJECT_ID(N'[dbo].[Addresses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Addresses];
GO
IF OBJECT_ID(N'[dbo].[Pricings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pricings];
GO
IF OBJECT_ID(N'[dbo].[Occasions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Occasions];
GO
IF OBJECT_ID(N'[dbo].[Contacts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Contacts];
GO
IF OBJECT_ID(N'[dbo].[Halls]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Halls];
GO
IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[Logins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Logins];
GO
IF OBJECT_ID(N'[dbo].[LoginActivities]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LoginActivities];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'VenueVendors'
CREATE TABLE [dbo].[VenueVendors] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Login_Id] int  NOT NULL
);
GO

-- Creating table 'Addresses'
CREATE TABLE [dbo].[Addresses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Address_Line_1] nvarchar(max)  NOT NULL,
    [Address_Line_2] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [State] nvarchar(max)  NOT NULL,
    [Zip] nvarchar(max)  NOT NULL,
    [Address_Line_3] nvarchar(max)  NOT NULL,
    [ContactId] int  NOT NULL
);
GO

-- Creating table 'Pricings'
CREATE TABLE [dbo].[Pricings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DurationByHr] nvarchar(max)  NOT NULL,
    [Cost] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Events'
CREATE TABLE [dbo].[Events] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Contacts'
CREATE TABLE [dbo].[Contacts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [MiddleName] nvarchar(max)  NOT NULL,
    [Suffix] nvarchar(max)  NOT NULL,
    [WorkPhone] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [MobilePhone] nvarchar(max)  NOT NULL,
    [WorkEmail] nvarchar(max)  NOT NULL,
    [VenueVendorId] int  NOT NULL,
    [Hall_Id] int  NOT NULL
);
GO

-- Creating table 'Halls'
CREATE TABLE [dbo].[Halls] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [RoomNumber] nvarchar(max)  NOT NULL,
    [FloorNumber] nvarchar(max)  NOT NULL,
    [Occupancy] nvarchar(max)  NOT NULL,
    [VenueVendorId] int  NOT NULL,
    [Pricing_Id] int  NOT NULL,
    [Address_Id] int  NOT NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Contact_Id] int  NOT NULL,
    [Hall_Id] int  NOT NULL,
    [Login_Id] int  NOT NULL
);
GO

-- Creating table 'Logins'
CREATE TABLE [dbo].[Logins] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Username] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'LoginActivities'
CREATE TABLE [dbo].[LoginActivities] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Timestamp] nvarchar(max)  NOT NULL,
    [LoginId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'VenueVendors'
ALTER TABLE [dbo].[VenueVendors]
ADD CONSTRAINT [PK_VenueVendors]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Addresses'
ALTER TABLE [dbo].[Addresses]
ADD CONSTRAINT [PK_Addresses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pricings'
ALTER TABLE [dbo].[Pricings]
ADD CONSTRAINT [PK_Pricings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [PK_Events]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Contacts'
ALTER TABLE [dbo].[Contacts]
ADD CONSTRAINT [PK_Contacts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Halls'
ALTER TABLE [dbo].[Halls]
ADD CONSTRAINT [PK_Halls]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Logins'
ALTER TABLE [dbo].[Logins]
ADD CONSTRAINT [PK_Logins]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'LoginActivities'
ALTER TABLE [dbo].[LoginActivities]
ADD CONSTRAINT [PK_LoginActivities]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ContactId] in table 'Addresses'
ALTER TABLE [dbo].[Addresses]
ADD CONSTRAINT [FK_ContactAddress1]
    FOREIGN KEY ([ContactId])
    REFERENCES [dbo].[Contacts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ContactAddress1'
CREATE INDEX [IX_FK_ContactAddress1]
ON [dbo].[Addresses]
    ([ContactId]);
GO

-- Creating foreign key on [Pricing_Id] in table 'Halls'
ALTER TABLE [dbo].[Halls]
ADD CONSTRAINT [FK_HallPricing]
    FOREIGN KEY ([Pricing_Id])
    REFERENCES [dbo].[Pricings]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HallPricing'
CREATE INDEX [IX_FK_HallPricing]
ON [dbo].[Halls]
    ([Pricing_Id]);
GO

-- Creating foreign key on [Address_Id] in table 'Halls'
ALTER TABLE [dbo].[Halls]
ADD CONSTRAINT [FK_HallAddress]
    FOREIGN KEY ([Address_Id])
    REFERENCES [dbo].[Addresses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HallAddress'
CREATE INDEX [IX_FK_HallAddress]
ON [dbo].[Halls]
    ([Address_Id]);
GO

-- Creating foreign key on [Hall_Id] in table 'Contacts'
ALTER TABLE [dbo].[Contacts]
ADD CONSTRAINT [FK_HallContact]
    FOREIGN KEY ([Hall_Id])
    REFERENCES [dbo].[Halls]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HallContact'
CREATE INDEX [IX_FK_HallContact]
ON [dbo].[Contacts]
    ([Hall_Id]);
GO

-- Creating foreign key on [VenueVendorId] in table 'Halls'
ALTER TABLE [dbo].[Halls]
ADD CONSTRAINT [FK_VenueVendorHall]
    FOREIGN KEY ([VenueVendorId])
    REFERENCES [dbo].[VenueVendors]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VenueVendorHall'
CREATE INDEX [IX_FK_VenueVendorHall]
ON [dbo].[Halls]
    ([VenueVendorId]);
GO

-- Creating foreign key on [VenueVendorId] in table 'Contacts'
ALTER TABLE [dbo].[Contacts]
ADD CONSTRAINT [FK_VenueVendorContact]
    FOREIGN KEY ([VenueVendorId])
    REFERENCES [dbo].[VenueVendors]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VenueVendorContact'
CREATE INDEX [IX_FK_VenueVendorContact]
ON [dbo].[Contacts]
    ([VenueVendorId]);
GO

-- Creating foreign key on [Contact_Id] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [FK_CustomerContact]
    FOREIGN KEY ([Contact_Id])
    REFERENCES [dbo].[Contacts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerContact'
CREATE INDEX [IX_FK_CustomerContact]
ON [dbo].[Customers]
    ([Contact_Id]);
GO

-- Creating foreign key on [Hall_Id] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [FK_CustomerHall]
    FOREIGN KEY ([Hall_Id])
    REFERENCES [dbo].[Halls]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerHall'
CREATE INDEX [IX_FK_CustomerHall]
ON [dbo].[Customers]
    ([Hall_Id]);
GO

-- Creating foreign key on [LoginId] in table 'LoginActivities'
ALTER TABLE [dbo].[LoginActivities]
ADD CONSTRAINT [FK_LoginActivityLogin]
    FOREIGN KEY ([LoginId])
    REFERENCES [dbo].[Logins]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LoginActivityLogin'
CREATE INDEX [IX_FK_LoginActivityLogin]
ON [dbo].[LoginActivities]
    ([LoginId]);
GO

-- Creating foreign key on [Login_Id] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [FK_CustomerLogin]
    FOREIGN KEY ([Login_Id])
    REFERENCES [dbo].[Logins]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerLogin'
CREATE INDEX [IX_FK_CustomerLogin]
ON [dbo].[Customers]
    ([Login_Id]);
GO

-- Creating foreign key on [Login_Id] in table 'VenueVendors'
ALTER TABLE [dbo].[VenueVendors]
ADD CONSTRAINT [FK_VenueVendorLogin]
    FOREIGN KEY ([Login_Id])
    REFERENCES [dbo].[Logins]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VenueVendorLogin'
CREATE INDEX [IX_FK_VenueVendorLogin]
ON [dbo].[VenueVendors]
    ([Login_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
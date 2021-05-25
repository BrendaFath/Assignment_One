-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/sn5Rs2
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Child] (
    [ChildID] -  NOT NULL ,
    [Name] string  NOT NULL ,
    [Age] Int  NOT NULL ,
    [Birthdate] int  NOT NULL ,
    [Special] string  NOT NULL ,
    [ParentID] int  NOT NULL ,
    [StaffID] int  NOT NULL ,
    CONSTRAINT [PK_Child] PRIMARY KEY CLUSTERED (
        [ChildID] ASC
    )
)

CREATE TABLE [Instructions] (
    [SpecialInstID] ->  NOT NULL ,
    [ChildID] int  NOT NULL ,
    CONSTRAINT [PK_Instructions] PRIMARY KEY CLUSTERED (
        [SpecialInstID] ASC
    )
)

CREATE TABLE [Allergies] (
    [AllergyID] ->  NOT NULL ,
    [ChildID] int  NOT NULL ,
    CONSTRAINT [PK_Allergies] PRIMARY KEY CLUSTERED (
        [AllergyID] ASC
    )
)

CREATE TABLE [Car] (
    [CarID] -  NOT NULL ,
    [ParentID] int  NOT NULL ,
    [Make] text  NOT NULL ,
    [Model] text  NOT NULL ,
    [Color] text  NOT NULL ,
    CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED (
        [CarID] ASC
    )
)

CREATE TABLE [Parent] (
    [ParentID] int  NOT NULL ,
    [ParentLastName] text  NOT NULL ,
    [ParentFirstName] text  NOT NULL ,
    [Address] string  NOT NULL ,
    [ChildID] int  NOT NULL ,
    [Co-Parent] text  NOT NULL ,
    [CarID] int  NOT NULL ,
    [LicensePlate] int  NOT NULL ,
    [DLnumber] int  NOT NULL ,
    CONSTRAINT [PK_Parent] PRIMARY KEY CLUSTERED (
        [ParentID] ASC,[ChildID] ASC
    )
)

CREATE TABLE [Staff] (
    [StaffID] int  NOT NULL ,
    [StaffName] text  NOT NULL ,
    [Address] string  NOT NULL ,
    [Pay-Rate] Int  NOT NULL ,
    CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED (
        [StaffID] ASC
    )
)

CREATE TABLE [Supplies] (
    [SupplyID] >-  NOT NULL ,
    [ChildID] int  NOT NULL ,
    CONSTRAINT [PK_Supplies] PRIMARY KEY CLUSTERED (
        [SupplyID] ASC
    )
)

CREATE TABLE [Times] (
    [PickUp] string  NOT NULL ,
    [DropOff] string  NOT NULL ,
    [ChildID] int  NOT NULL ,
    [ChildName] text  NOT NULL ,
    [ParentID] int  NOT NULL ,
    [ParentName] text  NOT NULL ,
    CONSTRAINT [PK_Times] PRIMARY KEY CLUSTERED (
        [ChildID] ASC,[ParentID] ASC
    )
)

ALTER TABLE [Child] WITH CHECK ADD CONSTRAINT [FK_Child_ChildID] FOREIGN KEY([ChildID])
REFERENCES [Staff] ([StaffID])

ALTER TABLE [Child] CHECK CONSTRAINT [FK_Child_ChildID]

ALTER TABLE [Instructions] WITH CHECK ADD CONSTRAINT [FK_Instructions_SpecialInstID] FOREIGN KEY([SpecialInstID])
REFERENCES [Child] ([ChildID])

ALTER TABLE [Instructions] CHECK CONSTRAINT [FK_Instructions_SpecialInstID]

ALTER TABLE [Allergies] WITH CHECK ADD CONSTRAINT [FK_Allergies_AllergyID] FOREIGN KEY([AllergyID])
REFERENCES [Child] ([ChildID])

ALTER TABLE [Allergies] CHECK CONSTRAINT [FK_Allergies_AllergyID]

ALTER TABLE [Car] WITH CHECK ADD CONSTRAINT [FK_Car_CarID] FOREIGN KEY([CarID])
REFERENCES [Parent] ([ParentID])

ALTER TABLE [Car] CHECK CONSTRAINT [FK_Car_CarID]

ALTER TABLE [Supplies] WITH CHECK ADD CONSTRAINT [FK_Supplies_SupplyID] FOREIGN KEY([SupplyID])
REFERENCES [Child] ([ChildID])

ALTER TABLE [Supplies] CHECK CONSTRAINT [FK_Supplies_SupplyID]

ALTER TABLE [Times] WITH CHECK ADD CONSTRAINT [FK_Times_ChildID] FOREIGN KEY([ChildID])
REFERENCES [Parent] ([ParentID])

ALTER TABLE [Times] CHECK CONSTRAINT [FK_Times_ChildID]

COMMIT TRANSACTION QUICKDBD
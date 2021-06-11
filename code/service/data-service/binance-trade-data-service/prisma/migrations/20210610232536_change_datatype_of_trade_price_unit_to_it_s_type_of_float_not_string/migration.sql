/*
  Warnings:

  - You are about to alter the column `price_Unit` on the `Trade` table. The data in that column could be lost. The data in that column will be cast from `String` to `Float`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Trade" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "datetime" DATETIME NOT NULL,
    "symbol" TEXT NOT NULL,
    "feeSymbol" TEXT NOT NULL DEFAULT 'USD',
    "type" TEXT NOT NULL,
    "amount_Traded" INTEGER NOT NULL,
    "amount_Fee" REAL,
    "price_Unit" REAL,
    "price_Total" REAL,
    "price_Subtotal" REAL,
    "orderID_Exchange" INTEGER,
    "idTransaction" INTEGER,
    "idExchange" INTEGER,
    "idOrder" INTEGER,
    "idType" INTEGER,
    "idAsset" INTEGER,
    "idAsset_Fee" INTEGER,
    "idAsset_Price" INTEGER,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Trade" ("amount_Fee", "amount_Traded", "createdAt", "datetime", "feeSymbol", "id", "idAsset", "idAsset_Fee", "idAsset_Price", "idExchange", "idOrder", "idTransaction", "idType", "orderID_Exchange", "price_Subtotal", "price_Total", "price_Unit", "symbol", "type", "updatedAt") SELECT "amount_Fee", "amount_Traded", "createdAt", "datetime", "feeSymbol", "id", "idAsset", "idAsset_Fee", "idAsset_Price", "idExchange", "idOrder", "idTransaction", "idType", "orderID_Exchange", "price_Subtotal", "price_Total", "price_Unit", "symbol", "type", "updatedAt" FROM "Trade";
DROP TABLE "Trade";
ALTER TABLE "new_Trade" RENAME TO "Trade";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

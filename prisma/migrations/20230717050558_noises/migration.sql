-- CreateTable
CREATE TABLE "Keyboard" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "color" TEXT,
    "layout" TEXT,
    "finish" TEXT,
    "price" INTEGER,

    CONSTRAINT "Keyboard_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "KeySwitch" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,

    CONSTRAINT "KeySwitch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "KeyCap" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "colorway" TEXT NOT NULL,
    "price" INTEGER NOT NULL,

    CONSTRAINT "KeyCap_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Audio" (
    "id" SERIAL NOT NULL,
    "key1AudioUrl" TEXT NOT NULL,
    "spaceAudioUrl" TEXT NOT NULL,
    "stabAudioUrl" TEXT NOT NULL,
    "keyboardId" INTEGER NOT NULL,
    "keySwitchId" INTEGER NOT NULL,
    "keyCapId" INTEGER NOT NULL,

    CONSTRAINT "Audio_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Audio_keyboardId_keySwitchId_keyCapId_idx" ON "Audio"("keyboardId", "keySwitchId", "keyCapId");

-- CreateIndex
CREATE UNIQUE INDEX "Audio_keyboardId_keySwitchId_keyCapId_key" ON "Audio"("keyboardId", "keySwitchId", "keyCapId");

-- AddForeignKey
ALTER TABLE "Audio" ADD CONSTRAINT "Audio_keyboardId_fkey" FOREIGN KEY ("keyboardId") REFERENCES "Keyboard"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Audio" ADD CONSTRAINT "Audio_keySwitchId_fkey" FOREIGN KEY ("keySwitchId") REFERENCES "KeySwitch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Audio" ADD CONSTRAINT "Audio_keyCapId_fkey" FOREIGN KEY ("keyCapId") REFERENCES "KeyCap"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

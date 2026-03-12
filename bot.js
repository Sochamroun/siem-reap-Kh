const mineflayer = require('mineflayer')

const HOST = '127.0.0.1'
const PORT = 25565
const VERSION = '1.12.2'
const BOT_COUNT = 10
const STAY_TIME = 10 * 60 * 1000

const names = [
  "Dream","Technoblade","Illumina","Fruitberries","Sapnap",
  "GeorgeNotFound","TommyInnit","Ranboo","Tubbo","Purpled",
  "Quig","PeteZahHutt","CaptainSparklez","Grian","MumboJumbo",
  "DanTDM","Skeppy","BadBoyHalo","TapL","Krinios"
]

function randomName() {
  const base = names[Math.floor(Math.random()*names.length)]
  const num = Math.floor(Math.random()*9999)
  return base + num
}

function createBot() {

  const bot = mineflayer.createBot({
    host: HOST,
    port: PORT,
    username: randomName(),
    version: VERSION
  })

  bot.on('spawn', () => {
    console.log(bot.username + " joined")

    // random walk every 2 seconds
    const walk = setInterval(() => {

      const controls = ['forward','back','left','right']
      const c = controls[Math.floor(Math.random()*controls.length)]

      bot.setControlState(c,true)

      setTimeout(()=>{
        bot.setControlState(c,false)
      },1000)

    },2000)

    // leave after 10 minutes
    setTimeout(()=>{
      clearInterval(walk)
      bot.quit()
    }, STAY_TIME)

  })

  bot.on('end', () => {
    console.log(bot.username + " reconnecting...")
    setTimeout(createBot,5000)
  })

  bot.on('error', err => console.log(err))
}

for(let i=0;i<BOT_COUNT;i++){
  setTimeout(createBot, i*500)
}

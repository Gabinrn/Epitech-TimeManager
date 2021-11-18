<template>
  <div id="clock">

    <span class="time">{{ time }}</span>
    <div class="btn-container">
      <a id="start" v-on:click=start()>Start</a>
      <a id="stop" v-on:click=stop()>Stop</a>
      <a id="reset" v-on:click=reset()>Reset</a>
    </div>
  </div>
</template>

<script>
//import axios from "axios";
/* eslint-disable no-new */
export default {
  name: 'clock',
  data() {
    return {
      time: '00:00:00.000',
      timeBegan: null,
      timeStopped: null,
      stoppedDuration: 0,
      started: null,
      running: false,
      startTime: localStorage.getItem('time'),
      test: (new Date().toISOString().split('T')[1]).split('Z')[0],
      id: ""
    };
  },
  mounted() {
    this.getTime();
  },
  methods: {
    start() {
      localStorage.setItem("time", new Date().toISOString())
      if (this.running) return;

      if (this.timeBegan === null) {
        this.reset();
        this.timeBegan = new Date();
      }

      if (this.timeStopped !== null) {
        this.stoppedDuration += (new Date() - this.timeStopped);
      }

      this.started = setInterval(this.clockRunning, 10);
      this.running = true;
      const requestOptions = {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          clock: {
            time: new Date().toISOString(),
            status: true
          }
        })
      };
      fetch('http://localhost:4000/api/clocks/1', requestOptions)
          .then(response => response.json())
    },

    stop() {
      this.running = false;
      this.timeStopped = new Date();
      clearInterval(this.started);

      const requestOptions = {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          workingtimes: {
            start: this.startTime,
            end: new Date().toISOString()
          }
        })
      };
      fetch('http://localhost:4000/api/workingtimes/1', requestOptions)
          .then(response => response.json())
    },

    reset() {
      this.running = false;
      clearInterval(this.started);
      this.stoppedDuration = 0;
      this.timeBegan = null;
      this.timeStopped = null;
      this.time = "00:00:00.000";
    },

    clockRunning() {
      let currentTime = new Date(),
          timeElapsed = new Date(currentTime - this.timeBegan - this.stoppedDuration),
          hour = timeElapsed.getUTCHours(),
          min = timeElapsed.getUTCMinutes(),
          sec = timeElapsed.getUTCSeconds(),
          ms = timeElapsed.getUTCMilliseconds();

      this.time =
          this.zeroPrefix(hour, 2) + ":" +
          this.zeroPrefix(min, 2) + ":" +
          this.zeroPrefix(sec, 2) + "." +
          this.zeroPrefix(ms, 3);
    },

    zeroPrefix(num, digit) {
      let zero = '';
      for (let i = 0; i < digit; i++) {
        zero += '0';
      }
      return (zero + num).slice(-digit);
    }
  },
  getTime() {
    this.startTime = localStorage.getItem('time')
  }
}
</script>

<style>
    .clockComponent {
    justify-content: flex-end;
    flex-direction: column;
    border-radius: 10px;
    margin-right: 180px;
    height: 100%;
    }

    @import url('https://fonts.googleapis.com/css?family=Share+Tech+Mono');


    #clock {
      order: 0;
      margin-top: 20%;
      flex: 0 1 auto;
      align-self: center;
      color: #3c4cb4;
    }

    #clock .time {
      font-size: 6.5em;
    }

    #clock .text {
      margin-top: 30px;
      font-size: 1em;
      color: rgba(200, 200, 200, 0.15);
      text-align: center;
    }

    #clock .text a {
      text-decoration: none;
      color: inherit;
      transition: color 0.1s ease-out;
    }

    #clock .text a:hover {
      color: #d58047;
    }

    #clock .btn-container {
      display: flex;
      justify-content: center;
      margin-top: 15px;
    }

    #clock .btn-container a {
      text-align: center;
      font-family: 'Share Tech Mono', sans-serif;
      background: transparent;
      border: none;
      color: #3c4cb4;
      margin: 0 10px;

      text-transform: uppercase;
      font-size: 2em;
      cursor: pointer;
      transition: color 0.1s ease-out;
    }

    #clock .btn-container a:hover {
      color: #d58047;
    }
</style>
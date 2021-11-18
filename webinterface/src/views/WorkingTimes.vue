<template>
  <div class="app">
    <apexcharts width="700  " type="bar" :options="chartOptions" v-if="workingTimes && workingTimes.length" :series="series"></apexcharts>
  </div>
</template>

<script>
import VueApexCharts from 'vue-apexcharts'
import axios from 'axios';

export default {
  name: 'Chart',

  props: {id: Number},

  components: {
    apexcharts: VueApexCharts,
  },
  data: function () {
    return {
      end: "",
      start: "",
      user: "",
      workingTimes: [],
      Date: [],
      chartOptions: {
        chart: {
          id: 'workingTimeChart',
        },
        xaxis: {
          categories: [],
        },
      },

      series: [{
        name: 'Workingtimes',
        data: []
      }],
      noData: {
        text: 'Loading...'
      }
    }
  },
  mounted() {
    this.getWorkingTimes();
  },

  methods: { ///use methods
    getWorkingTimes() {
      axios.get('http://localhost:4000/api/workingtimes/' + this.id, {
        params: {
          start: '2012-03-24 01:45:12',
          end: new Date(Date.now())
        }
      }).then(function (response) {
        this.calc = (response.data.data).length
        for (let i = 0; i < (response.data.data).length; i++) {
          let dateEnd = new Date(response.data.data[i].end);
          let dateStart = new Date(response.data.data[i].start);
          this.end = dateEnd.getHours()- dateEnd.getMinutes()/60
          this.start = dateStart.getHours()- dateStart.getMinutes()/60
          this.Date.push("Day: " + dateEnd.getDate() + "/" + (dateEnd.getMonth() + 1 < 10 ? "0" + (dateEnd.getMonth() + 1) : (dateEnd.getMonth() + 1)))
          this.workingTimes.push((this.end - this.start) <= 0 ? (24 - this.start) + this.end : (this.end - this.start))
          this.chartOptions = {
            xaxis: {
              categories:
              this.Date
            }
          }
          this.series = [{
            data: this.workingTimes
          }]
        }
      }.bind(this));
    }
  }
};
</script>
<style scoped>

</style>


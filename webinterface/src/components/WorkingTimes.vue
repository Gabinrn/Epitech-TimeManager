<template>
  <div >
    <select v-model="select" @change=getWorkingTime()>
      <option v-for="option in options" v-bind:value="option.id" v-bind:key="option">
        {{ option.username }}
      </option>
    </select>
    <div class="workingTime">
      <md-table md-card class="table">
        <md-table-toolbar>
          <h1 class="md-title">WorkingTimes</h1>
          <md-button class="md-fab md-mini md-primary" @click="createModal()">
            <md-icon>add</md-icon>
          </md-button>
        </md-table-toolbar>

        <md-table-row class="head">
          <md-table-head>Start</md-table-head>
          <md-table-head>End</md-table-head>
          <md-table-head>Actions</md-table-head>
        </md-table-row>

        <md-table-row slot="md-table-row" v-for="workingTime in workingTimes" :key="workingTime.id">
          <md-table-cell md-label="start" md-sort-by="start" class="align-middle">{{ workingTime.start }}</md-table-cell>
          <md-table-cell md-label="end" md-sort-by="end">{{ workingTime.end }}</md-table-cell>
          <md-table-cell>
            <md-button class="md-fab md-mini md-primary" @click="setModal(workingTime)">
              <md-icon>edit</md-icon>
            </md-button>
            <md-button class="md-fab md-mini md-accent" @click="deleteWorkingTime(workingTime.id); getWorkingTime()">
              <md-icon>delete</md-icon>
            </md-button>
          </md-table-cell>
        </md-table-row>
      </md-table>

      <!--Create Modal-->
      <b-modal
          id="modal-prevent-closing"
          ref="modal"
          title="Submit Your WorkingTime"
          @hidden="resetModal"
          @ok="handleOk"
      >
        <form ref="form" @submit.stop.prevent="handleSubmit">

          <label for="datepicker-start">Start</label>
          <b-form-datepicker id="datepicker-start" v-model="start" class="mb-2"></b-form-datepicker>
          <b-form-timepicker v-model="startTime" locale="fr"></b-form-timepicker>

          <label for="datepicker-end">End</label>
          <b-form-datepicker id="datepicker-end" v-model="end" required class="mb-2"></b-form-datepicker>
          <b-form-timepicker v-model="endTime" required locale="fr"></b-form-timepicker>
        </form>
      </b-modal>

      <!--Update Modal-->

      <b-modal
          id="modal-prevent-closing"
          ref="update"
          title="Submit Your WorkingTime"
          @hidden="resetModal"
          @ok="handleUpdate"
      >
        <form ref="form" @submit.stop.prevent="handleSubmit">

          <label for="datepicker-start">Start</label>
          <b-form-datepicker id="datepicker-start" v-model="start" class="mb-2"></b-form-datepicker>
          <b-form-timepicker v-model="startTime" locale="fr"></b-form-timepicker>

          <label for="datepicker-end">End</label>
          <b-form-datepicker id="datepicker-end" v-model="end" required class="mb-2"></b-form-datepicker>
          <b-form-timepicker v-model="endTime" required locale="fr"></b-form-timepicker>
        </form>
      </b-modal>
      <WorkingTimes :id=select :key="key" class="graph"/>
    </div>
  </div>

</template>
<script>
/* eslint-disable no-new */
import axios from "axios";
import WorkingTimes from "../views/WorkingTimes"

export default {
  name: "App",
  components: {WorkingTimes},
  data() {
    return {
      start: '',
      end: '',
      startTime: '',
      workingTimeId: '',
      endTime: '',
      dateStart: '',
      user: '',
      key: 0,
      showDialog: false,
      active: false,
      value: null,
      workingTimes: [],
      selected: "",
      select: '1',
      options: []
    };
  },
  mounted() {
    this.getWorkingTime();
    this.getOption();
  },
  methods: {
    async getWorkingTime() {
      this.workingTimes = [];
      this.key++;
      axios.get('http://localhost:4000/api/workingtimes/' + this.select, {
        params: {
          start: "2012-03-24 01:45:12",
          end: "2022-03-24 01:45:12"
        }
      }).then(function (response) {
        for (let i = 0; i < (response.data.data).length; i++) {
          this.workingTimes.push(response.data.data[i])
        }
      }.bind(this));

    },
    getOption() {
      this.options = [];
      axios.get('http://localhost:4000/api/allUsers'
      ).then(function (response) {
        for (let i = 0; i < (response.data.data).length; i++) {
          this.options.push(response.data.data[i])
        }
      }.bind(this));
    },

    deleteWorkingTime(id) {
      axios.delete('http://localhost:4000/api/workingtimes/' + id)
          .then(() => {
            this.getWorkingTime();
          })
    },


    createModal() {
      this.$refs['modal'].show()
    },


    resetModal() {
      this.startState = null
      this.startTime = ""
      this.start = ""
      this.endTime = ""
      this.workingTimeId = ""
      this.end = ""
      this.user = ""

    },


    handleOk(bvModalEvt) {
      // Prevent modal from closing
      bvModalEvt.preventDefault()
      // Trigger submit handler
      this.handleSubmit()
    },

    setModal(workingTime) {
      this.$refs['update'].show()
      this.workingTimeId = workingTime.id
      this.user = workingTime.user
      this.dateStart = (workingTime.start).split('T')[0];
      this.timeStart = (workingTime.start).split('T')[1];
      this.dateEnd = (workingTime.end).split('T')[0];
      this.timeEnd = (workingTime.end).split('T')[1];

      this.startTime = this.timeStart
      this.start = this.dateStart
      this.endTime = this.timeEnd
      this.end = this.dateEnd
    },


    handleSubmit() {
      const requestOptions = {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          workingtimes: {
            start: this.start + "T" + this.startTime,
            end: this.end + "T" + this.endTime
          }
        })
      };
      fetch('http://localhost:4000/api/workingtimes/' + this.select, requestOptions)
          .then(response => response.json())
          .then(() => {
            this.getWorkingTime();
          })
    },


    handleUpdate() {
      const requestOptions = {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          workingtime: {
            user: this.user,
            start: this.start + "T" + this.startTime,
            end: this.end + "T" + this.endTime
          }
        })
      };
      fetch('http://localhost:4000/api/workingtimes/' + this.workingTimeId, requestOptions)
          .then(response => response.json())
          .then(() => {
            this.getWorkingTime();
          })
    },

  }
};
</script>
<style>
    .WorkingComponent {
    justify-content: flex-end;
    background-color: rgb(103, 103, 180);
    flex-direction: column;
    border-radius: 10px;
    margin-right: 180px;
    height: 100%;
    }
    .table{
      width: 700px !important;
      margin-right: 100px;
    }

    .workingTime{
      display: flex !important;
      flex-direction: row !important;
      justify-content: center;
      margin-top: 8%;
    }
</style>
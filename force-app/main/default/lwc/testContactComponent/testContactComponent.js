import { LightningElement, wire } from "lwc";
import getCourses from "@salesforce/apex/CourseController.getCourses";

export default class TestContactComponent extends LightningElement {
  name = "Test Name";
  department = "Test Department";
  alert = "";

  data;
  error;

  @wire(getCourses)
  courses;

  handleClick() {
    this.alert = `Name: ${this.name}-Department: ${this.department}`;
    // eslint-disable-next-line @lwc/lwc/no-async-operation
    setTimeout(() => {
      this.alert = "";
    }, 3000);
  }

  handleClear() {
    this.name = "";
    this.department = "";
  }

  handleNameChange(e) {
    this.name = e.target.value;
  }

  handleDepartmentChange(e) {
    this.department = e.target.value;
  }

  get isAlertFilled() {
    return this.alert !== "";
  }

  get firstAlert() {
    return this.alert.split("-")[0];
  }

  get secondAlert() {
    return this.alert.split("-")[1];
  }
}

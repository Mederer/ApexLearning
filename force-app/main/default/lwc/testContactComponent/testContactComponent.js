import { LightningElement, wire } from 'lwc';
import getCourses from '@salesforce/apex/CourseController.getCourses'

export default class TestContactComponent extends LightningElement {
    name = "Test Name";
    department = "Test Department";

    data;
    error;

    @wire(getCourses)
    courses;

    handleClick() {
        alert('Name: ' + this.name + ' Department: ' + this.department);
    }

    handleClear() {
        this.name = '';
        this.department = '';
    }

    handleNameChange(e) {
        this.name = e.target.value; 
    }

    handleDepartmentChange(e) {
        this.department = e.target.value;
    }
}
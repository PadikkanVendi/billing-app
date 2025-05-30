import { Component, OnInit } from '@angular/core';
import { CustomerService } from './customer.service';

@Component({
  selector: 'app-customer',
  template: '<div *ngFor="let customer of customers">{{customer.name}} - {{customer.email}}</div>'
})
export class CustomerComponent implements OnInit {
  customers = [];

  constructor(private service: CustomerService) {}

  ngOnInit(): void {
    this.service.getAll().subscribe(data => this.customers = data);
  }
}

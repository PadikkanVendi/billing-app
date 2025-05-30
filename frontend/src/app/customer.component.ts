import { Component, OnInit } from '@angular/core';
import { CustomerService } from './customer.service';

@Component({
  selector: 'app-customer',
  template: '<div *ngFor="let c of customers">{{c.name}} - {{c.email}}</div>',
})
export class CustomerComponent implements OnInit {
  customers: any[] = [];

  constructor(private service: CustomerService) {}

  ngOnInit() {
    this.service.getAll().subscribe(data => this.customers = data);
  }
}

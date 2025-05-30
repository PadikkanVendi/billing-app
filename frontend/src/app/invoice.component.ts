import { Component, OnInit } from '@angular/core';
import { InvoiceService } from './invoice.service';

@Component({
  selector: 'app-invoice',
  template: '<div *ngFor="let i of invoices">Invoice: {{i.amount}} on {{i.date}}</div>',
})
export class InvoiceComponent implements OnInit {
  invoices: any[] = [];

  constructor(private service: InvoiceService) {}

  ngOnInit() {
    this.service.getAll().subscribe(data => this.invoices = data);
  }
}

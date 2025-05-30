import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

import { AppComponent } from './app.component';
import { CustomerComponent } from './customer.component';
import { InvoiceComponent } from './invoice.component';

@NgModule({
  declarations: [
    AppComponent,
    CustomerComponent,
    InvoiceComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

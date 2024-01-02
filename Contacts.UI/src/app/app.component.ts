import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { MatDialog } from '@angular/material/dialog';
import { ContactDialogComponent } from './contact-dialog/contact-dialog.component';
import { Contact } from './interfaces/contact';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})

export class AppComponent {
  title = 'Contacts.UI';
  contacts: Contact[] = [];
  selectedContact: Contact | undefined;
  searchText: string = '';
  readonly APIUrl = "https://localhost:7218/";
  constructor(private http: HttpClient, public dialog: MatDialog) {
  }
  openContactDialog(isadd = true): void {
    if (isadd) {
      const dialogRef = this.dialog.open(ContactDialogComponent, {
        width: '480px',
        data: { contactStructure: {} as Contact }
      });
      dialogRef.afterClosed().subscribe(result => {
        if (result) {
          this.addContact(result);
        }
      });
    }
    else {
      const dialogRef = this.dialog.open(ContactDialogComponent, {
        width: '480px',
        data: { contactStructure: this.selectedContact }
      });
      dialogRef.afterClosed().subscribe(result => {
        if (result) {
          this.editContact(result);
        }
      });
    }
  }
  refreshContacts() {
    this.http.get(this.APIUrl + 'get-contacts').subscribe(data => {
      this.contacts = data as Contact[];
    })
  }
  ngOnInit() {
    this.refreshContacts();
  }
  addContact(result: any) {
    const body = result;
    this.http.post(this.APIUrl + 'post-contact', body).subscribe(data => {
      this.selectedContact = undefined;
      this.refreshContacts();
    });
  }
  selectContact(contact: Contact): void {
    this.selectedContact = contact;
  }
  deleteContact() {
    if (this.selectedContact) {
      this.http.delete(this.APIUrl + 'delete-contact?contactId=' + this.selectedContact.Id).subscribe(data => {
        this.selectedContact = undefined;
        this.refreshContacts();
      })
    }
  }
  editContact(result: any) {
    this.http.put(this.APIUrl + 'put-contact', result).subscribe(data => {
      this.selectedContact = result as Contact;
      this.refreshContacts();
    })
  }
  searchContacts(event: Event) {
    this.searchText = (event.target as HTMLInputElement).value;
    if (this.searchText.length >= 3) {
      this.contacts = this.contacts.filter(contact =>
        this.contactContainsSearchText(contact)
      );
    }
    else {
      this.refreshContacts();
    }
  }

  contactContainsSearchText(contact: Contact): boolean {
    return Object.values(contact).some(value =>
      value.toLowerCase().includes(this.searchText.toLowerCase())
    );
  }
}
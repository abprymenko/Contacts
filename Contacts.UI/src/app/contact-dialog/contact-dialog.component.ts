import { Component, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Contact } from '../interfaces/contact';

@Component({
  selector: 'app-contact-dialog',
  templateUrl: './contact-dialog.component.html',
  styleUrl: './contact-dialog.component.css'
})

export class ContactDialogComponent {
  newContact: Contact = {} as Contact;

  constructor(public dialogRef: MatDialogRef<ContactDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: { contactStructure: Contact }) {
    if (data && data.contactStructure) {
      this.newContact = { ...data.contactStructure };
    }
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

  onAddClick(): void {
    if (this.newContact?.CellNumber
      && this.newContact?.FirstName
      && this.newContact?.LastName) {
      this.dialogRef.close(this.newContact);
      this.newContact = {} as Contact;
    }
  }
}
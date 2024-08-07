

const String getEventsQuery = r'''
  query GetEvents {
    events {
      eventId
      eventName
      eventDate
      eventTime
      location
      description
    }
  }
''';

const String getUsersQuery = r'''
query getAttendees {
  attendees {
    attendeeId
    email
    eventId
    firstName
    lastName
    phone
    registrationDate
  }
}
''';



const String addAttendeeMutation = r'''
  mutation AddAttendee(
    $email: String!, 
    $eventId: Int!, 
    $firstName: String!, 
    $lastName: String!, 
    $phone: String!,
    $registrationDate: String
  ) {
    addAttendee(
      newAttendee: {
        email: $email,
        eventId: $eventId,
        firstName: $firstName,
        lastName: $lastName,
        phone: $phone,
        registrationDate: $registrationDate
      }
    ) {
      attendeeId
    }
  }
''';



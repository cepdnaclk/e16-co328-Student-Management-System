import React from 'react';
import CRUDTable,
{
  Fields,
  Field,
  CreateForm,
  UpdateForm,
  DeleteForm,
} from 'react-crud-table';

// Component's Base CSS
import './Table.css';

const DescriptionRenderer = ({ field }) => <textarea {...field} />;

let tasks = [
  {
    id: 1,
    institute: 'Create an example',
    firstname: 'First Name',
    lastname: 'Last Name',
    schcool: 'Schcool',
    description: 'Create an example of how to use the component',
  },
  {
    id: 2,
    institute: 'Improve',
    firstname: 'First Name',
    lastname: 'Last Name',
    schcool: 'Schcool',
    description: 'Improve the component!',
  },
];

const SORTERS = {
  NUMBER_ASCENDING: mapper => (a, b) => mapper(a) - mapper(b),
  NUMBER_DESCENDING: mapper => (a, b) => mapper(b) - mapper(a),
  STRING_ASCENDING: mapper => (a, b) => mapper(a).localeCompare(mapper(b)),
  STRING_DESCENDING: mapper => (a, b) => mapper(b).localeCompare(mapper(a)),
};

const getSorter = (data) => {
  const mapper = x => x[data.field];
  let sorter = SORTERS.STRING_ASCENDING(mapper);

  if (data.field === 'id') {
    sorter = data.direction === 'ascending' ?
      SORTERS.NUMBER_ASCENDING(mapper) : SORTERS.NUMBER_DESCENDING(mapper);
  } else {
    sorter = data.direction === 'ascending' ?
      SORTERS.STRING_ASCENDING(mapper) : SORTERS.STRING_DESCENDING(mapper);
  }

  return sorter;
};


let count = tasks.length;
const service = {
  fetchItems: (payload) => {
    let result = Array.from(tasks);
    result = result.sort(getSorter(payload.sort));
    return Promise.resolve(result);
  },
  create: (task) => {
    count += 1;
    tasks.push({
      ...task,
      id: count,
    });
    return Promise.resolve(task);
  },
  update: (data) => {
    const task = tasks.find(t => t.id === data.id);
    task.institute = data.institute;
    task.firstname = data.firstname;
    task.lastname = data.lastname;
    task.schcool = data.lastname;
    task.description = data.description;
    return Promise.resolve(task);
  },
  delete: (data) => {
    const task = tasks.find(t => t.id === data.id);
    tasks = tasks.filter(t => t.id !== task.id);
    return Promise.resolve(task);
  },
};

const styles = {
  container: { margin: 'auto', width: 'fit-content', padding: '25px' },
};

const TableComponent = () => (
  <div style={styles.container}>
    <CRUDTable
      caption="Student Registration"
      fetchItems={payload => service.fetchItems(payload)}
    >
      <Fields>

        <Field
          name="id"
          label="Id"
          hideInCreateForm
          readOnly
        />

        <Field
          name="institute"
          label="Institute"
          placeholder="Institute Institute"
        />

        <Field
          name="firstname"
          label="First Name"
          placeholder="First Name"
        />

        <Field
          name="lastname"
          label="Last Name"
          placeholder="Last Name"
        />

        <Field
          name="schcool"
          label="Schcool"
          placeholder="Schcool"
        />

        <Field
          name="description"
          label="Description"
          render={DescriptionRenderer}
        />

      </Fields>

      <CreateForm
        title="Add New Student"
        message="Create a new task!"
        trigger="Add New Student"
        onSubmit={task => service.create(task)}
        submitText="Create"
        validate={(values) => {
          const errors = {};
          if (!values.institute) {
            errors.institute = 'Please, provide the institute';
          }

          if (!values.firstname) {
            errors.firstname = 'Please, provide the first name';
          }

          if (!values.description) {
            errors.description = 'Please, provide adescription';
          }

          return errors;
        }}
      />

      <UpdateForm
        title="Task Update Process"
        message="Update task"
        trigger="Update"
        onSubmit={task => service.update(task)}
        submitText="Update"
        validate={(values) => {
          const errors = {};

          if (!values.id) {
            errors.id = 'Please, provide id';
          }

          if (!values.institute) {
            errors.institute = 'Please, provide the institute';
          }

          if (!values.firstname){
              errors.fistname = 'Please, privide the first name.';
          }

          if (!values.description) {
            errors.description = 'Please, provide the description';
          }

          return errors;
        }}
      />

      <DeleteForm
        title="Task Delete Process"
        message="Are you sure you want to delete the task?"
        trigger="Delete"
        onSubmit={task => service.delete(task)}
        submitText="Delete"
        validate={(values) => {
          const errors = {};
          if (!values.id) {
            errors.id = 'Please, provide id';
          }
          return errors;
        }}
      />
    </CRUDTable>
  </div>
);

export default TableComponent;
import DS from 'ember-data';

export default DS.Model.extend({
  firstName: DS.attr('string'),
  lastName: DS.attr('string'),
  nickname: DS.attr('string'),
  birthday: DS.attr('date'),
  team: DS.belongsTo('team')
});

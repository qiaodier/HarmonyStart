export interface IDataListener<M> {

  onSuccess(m: M): void;

  onFailure(error: string): void;
}